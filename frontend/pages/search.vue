<template>
  <v-app>
    <v-toolbar app dark fixed color="blue">
      <v-toolbar-title class="white--text text-xs-center">検索</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon active-class="" to="/">
        戻る
      </v-btn>
    </v-toolbar>
    <v-content>
      <v-container fluid>
        <v-layout row>
          <v-flex xs12>
            <v-select
              v-bind:items="items"
              label="学年"
              class="mb-4"
              single-line
              auto
              prepend-icon="school"
              hide-details
            ></v-select>

            <v-select
              bind:items="items"
              label="期間"
              class="mb-4"
              single-line
              auto
              prepend-icon="access_time"
              hide-details
            ></v-select>

            <v-select
              v-bind:items="items"
              label="教科"
              class="mb-4"
              single-line
              auto
              prepend-icon="book"
              hide-details
            ></v-select>

            <v-select
              v-bind:items="items"
              label="先生"
              class="mb-4"
              single-line
              auto
              prepend-icon="face"
              hide-details
            ></v-select>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
module.exports = {
  data: function () {
    return {
      items: ['hoge', 'fuga', 'piyo'],
    }
  },
}
</script>

<style scoped>
</style>
