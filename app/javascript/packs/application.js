// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', () => {
	document.querySelectorAll('.notification').forEach((notification) => {
		setTimeout(() => {
			notification.remove();
		}, 3600);
	});
});

window.addEventListener('turbolinks:load', () => {
	console.log("LOADED")
	// ? Validation for form

	const password_input = document.getElementById('user_password')
	const password_confirmation = document.getElementById('user_password_confirmation')

	if (password_input) {
		password_input.addEventListener('change', () => {
			if (password_input.value.length < 6) {
				password_input.setCustomValidity('Password must be at least 6 characters.');
			} else {
				password_input.setCustomValidity('')
			}
		});

		if (password_confirmation) {
			password_confirmation.addEventListener('change', () => {
				if (password_input.value == password_confirmation.value) {
					password_confirmation.setCustomValidity('')
				} else {
					password_confirmation.setCustomValidity('Passwords must match.')
				}
			});
		}
	}
});
