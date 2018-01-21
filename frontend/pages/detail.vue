<template>
  <v-app>
    <v-toolbar app dark fixed color="blue">
      <v-toolbar-title class="white--text">4年 前期中間 物理</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon active-class="" to="/">
        戻る
      </v-btn>
    </v-toolbar>
    <v-content>
      <v-container fluid>
        <v-layout row wrap>
          <v-carousel>
            <v-carousel-item src="https://placehold.jp/200x300.png"></v-carousel-item>
            <v-carousel-item src="https://placehold.jp/200x300.png"></v-carousel-item>
            <v-carousel-item src="https://placehold.jp/200x300.png"></v-carousel-item>
            <v-carousel-item src="https://placehold.jp/200x300.png"></v-carousel-item>
          </v-carousel>
          <v-flex xs12>
            <div class="mt-5">
              <v-card class="mb-3">
                <v-card-title primary-title>
                  <div class="headline">学年</div>
                </v-card-title>
                <v-card-text class="display-2">4年</v-card-text>
              </v-card>
              <v-card class="mb-3">
                <v-card-title primary-title>
                  <div class="headline">期間</div>
                </v-card-title>
                <v-card-text class="display-2">前期中間</v-card-text>
              </v-card>
              <v-card class="mb-3">
                <v-card-title primary-title>
                  <div class="headline">教科</div>
                </v-card-title>
                <v-card-text class="display-2">物理</v-card-text>
              </v-card>
              <v-card class="mb-3">
                <v-card-title primary-title>
                  <div class="headline">先生</div>
                </v-card-title>
                <v-card-text class="display-2">笠井</v-card-text>
              </v-card>
            </div>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
</script>

<style scoped>
</style>
