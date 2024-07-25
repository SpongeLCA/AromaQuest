import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["icon"];
  changeFavorite(event) {
    event.preventDefault();
    fetch(this.element.href, {
      method: "POST",
      headers: {"Accept": "application/json", "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')},
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      if (data.favorite) {
        this.iconTarget.classList.remove("fa-regular");
        this.iconTarget.classList.add("fa-solid");
      } else {
        this.iconTarget.classList.remove("fa-solid")
        this.iconTarget.classList.add("fa-regular")
      }
    });
  }
}
