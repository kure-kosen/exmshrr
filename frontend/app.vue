<template>
  <div id="root">
    <router-view></router-view>
  </div>
</template>

<script></script>

<style>
@import url("https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons");

@font-face {
  font-family: 'Noto Sans Japanese';
  font-style: normal;
  font-weight: 400;
  src: local('NotoSansJP-Regular.otf'),
    url(//fonts.gstatic.com/ea/notosansjapanese/v6/NotoSansJP-Regular.woff2) format('woff2'),
    url(//fonts.gstatic.com/ea/notosansjapanese/v6/NotoSansJP-Regular.woff) format('woff'),
    url(//fonts.gstatic.com/ea/notosansjapanese/v6/NotoSansJP-Regular.otf) format('opentype');
}

#root {
  font-family: 'Noto Sans Japanese';
}
</style>
