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
            label="学年"
            required
            :items="grades"
            v-model="grade"
            prepend-icon="school"
            ></v-select>

          <v-select
            label="期間"
            required
            :items="Object.keys(kinds)"
            v-model="kind"
            prepend-icon="date_range"
            ></v-select>

          <v-select
            label="教科"
            required
            :items="Object.keys(subjects)"
            v-model="subject"
            prepend-icon="book"
            ></v-select>

          <v-select
            label="先生"
            class="mb-4"
            required
            :items="Object.keys(teachers)"
            v-model="teacher"
            prepend-icon="face"
            ></v-select>

            <div class="text-xs-right">
              <v-btn color="blue darked-1" dark @click="submit">検索</v-btn>
            </div>
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
      valid: false,
      grades: [1, 2, 3, 4, 5],
      kinds: {
        '前期中間': 0,
        '前期末': 1,
        '後期中間': 2,
        '学年末': 3
      },
      subjects: {
        '微分積分': 1,
        '応用物理': 2,
        '電気電子計測': 3,
        '電気基礎': 4
      },
      teachers: {
        'ほげ先生': 1,
        'ふが先生': 2,
        'ぴよ先生': 3,
        'ふー先生': 4,
      },
      grade: null,
      kind: null,
      subject: null,
      teacher: null,
    }
  },
  methods: {
    submit: function() {
      this.$router.push({ path: '/',
                          query: { grade: this.grade,
                                   kind: this.kinds[this.kind],
                                   subject_id: this.subjects[this.subject],
                                   teacher_id: this.teachers[this.teacher] } })
    },
  }
}
</script>

<style scoped>
</style>
