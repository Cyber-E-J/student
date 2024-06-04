<template>
  <div>
    <el-container>
      <el-header class="header">
        <div class="header-content">
          <i class="el-icon-s-home header-icon"></i>
          选课管理系统
        </div>
      </el-header>

      <el-main>
        <el-card class="login-module">
          <div slot="header" class="clearfix">
            <span class="login-title">
              <i class="el-icon-office-building" style="margin-right: 18px"></i>
              登陆
            </span>
          </div>
          <div>
            <el-form
              :model="ruleForm"
              :rules="rules"
              ref="ruleForm"
              label-width="100px"
              class="demo-ruleForm"
            >
              <el-form-item label="用户 ID" prop="id">
                <el-input
                  v-model.number="ruleForm.id"
                  prefix-icon="el-icon-user"
                ></el-input>
              </el-form-item>

              <el-form-item label="用户密码" prop="password">
                <el-input
                  v-model="ruleForm.password"
                  placeholder="请输入密码"
                  show-password
                  prefix-icon="el-icon-lock"
                ></el-input>
              </el-form-item>

              <el-form-item label="用户类型" prop="type">
                <el-radio-group v-model="ruleForm.type">
                  <el-radio label="student" value="student">学生</el-radio>
                </el-radio-group>
              </el-form-item>

              <el-form-item class="form-actions">
                <el-button type="primary" @click="submitForm('ruleForm')">登陆</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
      </el-main>
    </el-container>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      ruleForm: {
        id: null,
        password: null,
        type: 'student',
      },
      rules: {
        id: [
          { required: true, message: "请输入用户 ID", trigger: "blur" },
          { type: "number", message: "请输入数字", trigger: "blur" },
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }],
        type: [{ required: true, message: "请选择用户类型", trigger: "change" }],
      },
    };
  },
  methods: {
    submitForm(formName) {
      const that = this;
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let check = false;
          let name = null;

          axios.get("http://localhost:10086/info/getCurrentTerm")
            .then(function (resp) {
              sessionStorage.setItem("currentTerm", resp.data);
            });

          axios.get("http://localhost:10086/info/getForbidCourseSelection")
            .then(function (resp) {
              sessionStorage.setItem("ForbidCourseSelection", resp.data);
            });

          if (that.ruleForm.type === "student") {
            let form = {
              sid: that.ruleForm.id,
              password: that.ruleForm.password,
            };
            axios.post("http://localhost:10086/student/login", form)
              .then(function (resp) {
                console.log("学生登陆验证信息：" + resp.data);
                check = resp.data;
                if (check === true) {
                  axios.get("http://localhost:10086/student/findById/" + that.ruleForm.id)
                    .then(function (resp) {
                      console.log("登陆页正在获取用户信息" + resp.data);
                      name = resp.data.sname;

                      sessionStorage.setItem("token", "true");
                      sessionStorage.setItem("type", that.ruleForm.type);
                      sessionStorage.setItem("name", name);
                      sessionStorage.setItem("sid", resp.data.sid);

                      that.$message({
                        showClose: true,
                        message: "登陆成功，欢迎 " + name + "!",
                        type: "success",
                      });

                      console.log("正在跳转：" + "/" + that.ruleForm.type);

                      // 3. 路由跳转
                      that.$router.push({
                        path: "/" + that.ruleForm.type,
                        query: {},
                      });
                    });
                } else {
                  that.$message({
                    showClose: true,
                    message: "账号密码错误，请联系管理员",
                    type: "error",
                  });
                }
              });
          } else {
            console.log("! error type");
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style>
body {
  background-color: #f0f2f5;
  font-family: 'Roboto', sans-serif;
}

.header {
  background: linear-gradient(90deg, #4A90E2, #34A2FF);
  text-align: center;
  padding: 15px 0;
  box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
}

.header-content {
  font-size: 28px;
  font-weight: 700;
  color: #ffffff;
  display: flex;
  justify-content: center;
  align-items: center;
}

.header-icon {
  margin-right: 12px;
  font-size: 32px;
}

.login-title {
  text-align: center;
  font-size: 24px;
  font-family: 'Microsoft YaHei', sans-serif;
  color: #333333;
}

.login-module {
  margin: 0 auto;
  margin-top: 80px;
  padding: 30px;
  max-width: 450px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  background-color: #ffffff;
  border-radius: 10px;
  transition: all 0.3s;
}

.login-module:hover {
  transform: translateY(-5px);
}

.el-form-item {
  margin-bottom: 25px;
}

.el-radio-group {
  display: flex;
  justify-content: space-between;
}

.el-radio {
  color: #409EFF;
}

.form-actions {
  display: flex;
  justify-content: space-between;
}
</style>