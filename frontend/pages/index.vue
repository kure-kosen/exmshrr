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
          <v-flex xs12 v-for="exam in exams" :key='exam.attributes.id'>
            <v-card append :to="{ name: 'exam', params: { id: exam.id } }">
              <v-card-media :src="exam.attributes.images[0]" height="200px"></v-card-media>
              <v-card-title primary-title>
                <h3 class="headline mb-0">{{ exam.relationships.subject.data.name }}</h3>
              </v-card-title>
              <v-card-text>
                <div>
                  <v-chip label outline color="orange">{{ exam.attributes.grade + '年' }}</v-chip>
                  <v-chip label outline color="light-green">{{ exam.attributes.kind }}</v-chip>
                  <v-chip label outline color="light-blue">{{ exam.relationships.teacher.data.name }}</v-chip>
                </div>
              </v-card-text>
            </v-card>
          </v-flex>
          <v-flex xs12 v-if="exams.length == 0">
            検索条件に当てはまる過去問はありません。
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
      exams: []
    }
  },
  props: {
    query: {
      type: Object
    }
  },
  mounted: function () {
    let search_query = '?grade=' + (this.query.grade || '') + '&kind=' + (this.query.kind || '') + '&subject_id=' + (this.query.subject_id || '') + '&teacher_id=' + (this.query.teacher_id || '')
    console.log('search_query: ' + search_query)

    that = this
    this.axios.get('/api/exams' + search_query)
      .then(function (response) {
        that.exams = response.data.data
      })
  }
}
</script>

<style scoped></style>
