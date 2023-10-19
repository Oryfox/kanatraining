<script>
const hiragana = "あ, い, う, え, お, か, き, く, け, こ, さ, し, す, せ, そ, た, ち, つ, て, と, な, に, ぬ, ね, の, は, ひ, ふ, へ, ほ, ま, み, む, め, も, や, ゆ, よ, ら, り, る, れ, ろ, わ, を, ん"
const katakana = "ア, イ, ウ, エ, オ, カ, キ, ク, ケ, コ, サ, シ, ス, セ, ソ, タ, チ, ツ, テ, ト, ナ, ニ, ヌ, ネ, ノ, ハ, ヒ, フ, ヘ, ホ, マ, ミ, ム, メ, モ, ヤ, ユ, ヨ, ラ, リ, ル, レ, ロ, ワ, ヲ, ン"
const soundMap = {
  "あ": "a",
  "い": "i",
  "う": "u",
  "え": "e",
  "お": "o",
  "か": "ka",
  "き": "ki",
  "く": "ku",
  "け": "ke",
  "こ": "ko",
  "さ": "sa",
  "し": "shi",
  "す": "su",
  "せ": "se",
  "そ": "so",
  "た": "ta",
  "ち": "chi",
  "つ": "tsu",
  "て": "te",
  "と": "to",
  "な": "na",
  "に": "ni",
  "ぬ": "nu",
  "ね": "ne",
  "の": "no",
  "は": "ha",
  "ひ": "hi",
  "ふ": "fu",
  "へ": "he",
  "ほ": "ho",
  "ま": "ma",
  "み": "mi",
  "む": "mu",
  "め": "me",
  "も": "mo",
  "や": "ya",
  "ゆ": "yu",
  "よ": "yo",
  "ら": "ra",
  "り": "ri",
  "る": "ru",
  "れ": "re",
  "ろ": "ro",
  "わ": "wa",
  "を": "wo",
  "ん": "n",
  "ア": "a",
  "イ": "i",
  "ウ": "u",
  "エ": "e",
  "オ": "o",
  "カ": "ka",
  "キ": "ki",
  "ク": "ku",
  "ケ": "ke",
  "コ": "ko",
  "サ": "sa",
  "シ": "shi",
  "ス": "su",
  "セ": "se",
  "ソ": "so",
  "タ": "ta",
  "チ": "chi",
  "ツ": "tsu",
  "テ": "te",
  "ト": "to",
  "ナ": "na",
  "ニ": "ni",
  "ヌ": "nu",
  "ネ": "ne",
  "ノ": "no",
  "ハ": "ha",
  "ヒ": "hi",
  "フ": "fu",
  "ヘ": "he",
  "ホ": "ho",
  "マ": "ma",
  "ミ": "mi",
  "ム": "mu",
  "メ": "me",
  "モ": "mo",
  "ヤ": "ya",
  "ユ": "yu",
  "ヨ": "yo",
  "ラ": "ra",
  "リ": "ri",
  "ル": "ru",
  "レ": "re",
  "ロ": "ro",
  "ワ": "wa",
  "ヲ": "wo",
  "ン": "n"
}

export default {
  data() {
    return {
      symbols: hiragana.concat(katakana).split(', '),
      kanaText: '',
      yourtext: '',
      numberOfSymbols: 10
    }
  },
  created() {
    this.generate()
  },
  watch: {
    numberOfSymbols() {
      this.generate()
    }
  },
  methods: {
    giveRandomSymbol() {
      return this.symbols[Math.floor(Math.random() * this.symbols.length)]
    },
    generate() {
      this.kanaText = ''
      for (let i = 0; i < this.numberOfSymbols; i++) {
        this.kanaText = this.kanaText + this.giveRandomSymbol()
      }
    },
    popCorrect() {
      while (true) {
        if (this.kanaText.length == 0) {
          alert("Du hattest alles richtig!")
          this.generate()
          break;
        }
        let soundOfFirst = soundMap[this.kanaText[0]]
        let index = this.yourtext.indexOf(soundOfFirst)
        if (index === 0) {
          this.kanaText = this.kanaText.slice(1)
          this.yourtext = this.yourtext.slice(soundOfFirst.length)
        } else {
          break;
        }
      }
    },
    getFirstSound() {
      alert(soundMap[this.kanaText[0]])
    }
  }
}
</script>

<template>
  <div style="display:flex; flex-direction: column; height: 100vh; gap: 1rem; padding: 1rem;">
    <textarea
      style="flex: 1; font-size: x-large; background-color: var(--color-background-soft); border: solid thin var(--color-border); outline: none; color: var(--color-text); border-radius: 1rem;"
      v-model="kanaText" name="" id="" cols="30" rows="10"></textarea>
    <input v-model="numberOfSymbols" style="background-color: var(--color-background-soft); height: 2rem; font-size: large; padding: 6px; border: solid thin var(--color-border); outline: none; color: var(--color-text); border-radius: 1rem;" type="number">
    <textarea
      style="flex: 1; font-size: large; background-color: var(--color-background-soft); border: solid thin var(--color-border); outline: none; color: var(--color-text); border-radius: 1rem;"
      v-model="yourtext" name="" id="" cols="30" rows="10"></textarea>
    <div style="display: flex;">
      <button @click="popCorrect">Überprüfen</button>
      <button @click="getFirstSound">Help</button>
    </div>
  </div>
</template>