<template>
  <v-app>
    <v-toolbar app dark fixed color="blue">
      <v-btn icon class="ml-4" active-class="" to="/search">
        <v-icon>search</v-icon>
      </v-btn>
      <v-toolbar-title class="white--text text-xs-center">一覧</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon class="mr-4" active-class="" to="/add">
        <v-icon>add_circle</v-icon>
      </v-btn>
    </v-toolbar>
    <v-content>
      <v-container fluid grid-list-lg>
        <v-layout row wrap>
          <v-flex xs12 v-for="i in 9" :key='i'>
            <v-card to="/detail" append>
              <v-card-media src="https://placehold.jp/400x300.png" height="200px"></v-card-media>
              <v-card-title primary-title>
                <h3 class="headline mb-0">物理</h3>
              </v-card-title>
              <v-card-text>
                <div>
                  <v-chip label outline color="orange">4年</v-chip>
                  <v-chip label outline color="light-green">前期中間</v-chip>
                  <v-chip label outline color="light-blue">笠井</v-chip>
                </div>
              </v-card-text>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script></script>

<style scoped></style>
