import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["frame", "prepopulateInput"]

  connect() {
    this.prepopulateValue = null
  }

  open(e) {
    this.frameTarget.src = e.detail.url
  }

  onFrameLoad() {
    if (!this.prepopulateValue) return

    if (this.hasPrepopulateInputTarget) {
      this.prepopulateInputTarget.value = this.prepopulateValue
      this.prepopulateInputTarget.focus()
      this.prepopulateValue = null
    }
  }

  storePrepopulateValue(e) {
    this.prepopulateValue = e.detail.value
  }
}
