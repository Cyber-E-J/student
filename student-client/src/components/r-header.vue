<template>
  <div class="header-container">
      <!-- <el-button type="text" style="color: #333333; font-size: 18px" @click="out()">
        logout
      </el-button> -->
      <el-button type="text" @click="out()" class="custom-button">
        logout
      </el-button>
      <el-divider direction="vertical" style="color: #333333"></el-divider>
      <i class="el-icon-paperclip" style="margin-right: 18px"></i>
      <span>{{ currentTerm }}</span>
      <el-divider direction="vertical"></el-divider>
      <i class="el-icon-user" style="margin-right: 18px"></i>
      <span>{{ name }}</span>
  </div>
</template>

<script>
export default {
  name: "r-header",
  data() {
    return {
      name: null,
      currentTerm: null
    }
  },
  created() {
    this.name = sessionStorage.getItem("name")
    this.currentTerm = sessionStorage.getItem("currentTerm")
  },
  methods: {
    out() {
      sessionStorage.clear();
      this.$router.push('/')
    }
  }
}
</script>

<style scoped>

</style>

<style scoped>


.custom-button {
  color: #FFFFFF; /* 文字颜色 */
  font-size: 18px; /* 字体大小 */
  border: none; /* 去掉边框 */
  background-color: transparent; /* 透明背景 */
  padding: 5px 10px; /* 内边距调整 */
  border-radius: 5px; /* 轻微的圆角边缘 */
}

.custom-button:hover {
  color: #409EFF; /* 鼠标悬浮时的文字颜色 */
  background-color: #f2f2f2; /* 鼠标悬浮时的背景色 */
  cursor: pointer; /* 鼠标悬浮时的指针形状 */
}
span {
  color: #FFFFFF; /* 文字颜色 */
}
</style>