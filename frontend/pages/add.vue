<template>
  <v-app>
    <v-toolbar app dark fixed color="blue">
      <v-toolbar-title class="white--text">追加</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon active-class="" to="/">
        戻る
      </v-btn>
    </v-toolbar>
    <v-content>
      <v-container fluid>
        <v-layout row>
          <v-flex xs12>
            <v-form enctype="multipart/form-data" action="/api/exams" method="post" accept-charset="UTF-8" v-model="valid" >
              <input name="utf8" type="hidden" value="✓">
              <div class="mt-5 mb-5 text-xs-center">
                <label for="exam_files" id="file_label">
                  <v-icon large dark id="add_icon" color="white">add</v-icon>
                  <input @change="file_selected" type="file" id="exam_files" multiple="multiple">
                </label>
              </div>

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
                  <v-btn color="blue darked-1" dark @click="submit">追加</v-btn>
                </div>
            </v-form>
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
      exam_images: [],
    }
  },
  mounted: function () {
    document.body.querySelectorAll('input[disabled]').forEach(function(element) { element.removeAttribute('disabled') })
  },
  methods: {
    file_selected: function(e) {
      this.exam_images = e.target.files;
    },
    submit: function() {
      let formData = new FormData()

      formData.append('grade', this.grade)
      formData.append('kind', this.kinds[this.kind])
      formData.append('subject_id', this.subjects[this.subject])
      formData.append('teacher_id', this.teachers[this.teacher])
      Array.from(this.exam_images).forEach( function (file) {
        formData.append('exam_images[]', file)
      })

      let that = this

      this.axios({
        method: 'post',
        url: '/api/exams',
        headers: {
          'Content-Type': 'multipart/form-data'
        },
        data: formData
      })
        .then(function(response) {
          that.$router.push('/')
        })
        .catch(function(error) {
          console.error(error)
        })
    },
  }
}
</script>

<style scoped>
#file_label input {
  display: none;
}

#file_label {/*円の部分*/
    display: inline-block;
    background-color: rgb(40, 161, 249);
    width: 56px;/*幅*/
    height: 56px;/*高さ*/
    text-align: center;/*中央寄せ*/
    border-radius: 50%;/*角丸く*/
    transition: .3s;/*滑らかな動きに*/
    -webkit-box-shadow: 0 3px 5px -1px rgba(0,0,0,.2), 0 6px 10px 0 rgba(0,0,0,.14), 0 1px 18px 0 rgba(0,0,0,.12);
    box-shadow: 0 3px 5px -1px rgba(0,0,0,.2), 0 6px 10px 0 rgba(0,0,0,.14), 0 1px 18px 0 rgba(0,0,0,.12);
}

#file_label #add_icon {/*中央のアイコン*/
  color: white;
  line-height: 56px;/*＝幅と高さ*/
  vertical-align: middle;
  font-size: 26px;/*サイズ*/
}
</style>
