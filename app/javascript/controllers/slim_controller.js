import { Controller } from "@hotwired/stimulus"
// add the JS
import SlimSelect from 'slim-select'
// add the CSS
// import 'slim-select/dist/slimselect.css'
// import "slim-select/dist/slimselect.min.css";

// Connects to data-controller="slim-select"
export default class extends Controller {
  static targets = ['field']
  connect() {
    new SlimSelect({
      select: this.fieldTarget,
      // closeOnSelect: false
    })
  }
}