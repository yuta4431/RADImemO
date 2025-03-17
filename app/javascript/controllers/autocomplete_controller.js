import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    console.log("Autocomplete controller is connected!");
  }

  update() {
    console.log(this.inputTarget.value);
  }
}