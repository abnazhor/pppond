import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  openDialog() {
    this.dispatch("connect-btn-clicked", {detail: {url: this.urlValue}})
  }
}
