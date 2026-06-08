import {Controller} from "@hotwired/stimulus"

// Handles global paste-to-open behavior for the Add Pin dialog.
// Mounted on the dialog root element.
export default class extends Controller {
  static targets = ["trigger", "urlInput"]

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
    if (!text || !this.isUrl(text)) return

    if (!this.hasTriggerTarget) return

    event.preventDefault()
    this.triggerTarget.click()
    this.populateUrlField(text)
  }

  populateUrlField(url, attempt = 0) {
    if (this.hasUrlInputTarget) {
      this.urlInputTarget.value = url
      this.urlInputTarget.focus()
      return
    }

    if (attempt >= 15) return
    requestAnimationFrame(() => this.populateUrlField(url, attempt + 1))
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
