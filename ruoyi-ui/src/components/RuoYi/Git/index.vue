<template>
  <div>
    <svg-icon icon-class="github" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'taogithub',
  data() {
    return {
      url: 'https://github.com/rookieLiuyutao'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
