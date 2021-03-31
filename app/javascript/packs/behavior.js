class menuClick {
  // This executes when the function is instantiated.
  constructor() {
    var burger = document.querySelector('.navbar-burger');
	console.log(burger);
	var menu = document.querySelector('#'+burger.dataset.target);
    burger.addEventListener('click', function() {
        burger.classList.toggle('is-active');
        menu.classList.toggle('is-active');
    });
  }
}
// Wait for turbolinks to load, otherwise `document.querySelectorAll()` won't work
window.addEventListener("turbolinks:load", () => new menuClick());