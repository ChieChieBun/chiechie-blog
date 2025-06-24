// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("turbo:load", function() {
let commentSection = document.querySelector('.rightside');
let newCommentButton = document.createElement('button');
let br = document.createElement('br');
newCommentButton.innerHTML = 'Leave New Comment!';
newCommentButton.setAttribute("type", "button");
commentSection.prepend(newCommentButton);
commentSection.prepend(br);
let title = document.createElement('h2');
title.innerHTML = 'Comments';
commentSection.prepend(title);
let commentForm = commentSection.querySelector('form');

newCommentButton.addEventListener('click', event=>{
    newCommentButton.remove();
    br.remove();
    commentForm.classList.toggle('hidden');
})


const toggleButtons = document.querySelectorAll('.toggle-replies-button');
toggleButtons.forEach(button =>{
    button.addEventListener('click', function() {
        const repliesDiv = this.nextElementSibling;
        repliesDiv.classList.toggle('hidden');
        if (repliesDiv.classList.contains('hidden')) {
            this.textContent = 'View Replies';
        }
        else
        {
            this.textContent = 'Hide Replies';
             }
})})
});
