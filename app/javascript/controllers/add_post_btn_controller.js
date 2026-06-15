import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["urlBtn", "textBtn"]

  connect() {
    this.onPaste = this.onPaste.bind(this)
    window.addEventListener("paste", this.onPaste)
  }

  disconnect() {
    window.removeEventListener("paste", this.onPaste)
  }

  onPaste(event) {
    if (this.isEditableElement(document.activeElement)) return

    const text = event.clipboardData?.getData("text")?.trim()

    if (!text) return
    event.preventDefault()

    if (this.isUrl(text)) {
      this.dispatch("prepopulate", {prefix: "remote-dialog-btn", detail: {value: text}})
      this.urlBtnTarget.click()
    } else {
      this.dispatch("prepopulate", {prefix: "remote-dialog-btn", detail: {value: text}})
      this.textBtnTarget.click()
    }
  }

  isEditableElement(element) {
    if (!element) return false
    if (element.isContentEditable) return true

    const tag = element.tagName
    return tag === "INPUT" || tag === "TEXTAREA" || tag === "SELECT"
  }

  isUrl(value) {
    try {
      const url = new URL(value)
      return url.protocol === "http:" || url.protocol === "https:"
    } catch {
      return false
    }
  }
}
