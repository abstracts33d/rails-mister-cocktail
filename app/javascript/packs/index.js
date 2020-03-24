import Typed from 'typed.js';
import AOS from 'aos';

function build_container(parent_el, containing_el) {
  let parent = document.querySelector(`#${parent_el} .first`);
  let container = document.createElement('div');
  container.innerHTML = '<span class="first"></span>';
  container.id =`${containing_el}`;
  parent.parentNode.insertBefore( container, parent.nextSibling );
  return container = document.querySelector(`div#${parent_el} div#${containing_el} .first`);
}
function dynamic_hover_chars(parent_el, containing_el, toggle_class, string){
  let container = build_container(parent_el, containing_el);
  Array.from(string).forEach((l, i) => {
    let letter = document.createElement('div');
    letter.innerHTML = `${l}`;
    letter.classList.add('letter');
    letter.setAttribute('data-letter', `${l}_${i}`);
    container.parentNode.insertBefore( letter, container );
  })

  const letters = document.querySelectorAll('.letter');
  let lettersTransitionState = [];

  function removeTransition(e){
    if (e.propertyName !== 'transform') return;
    lettersTransitionState[`${e.target.dataset.letter}`] = false;
    if (this.classList.contains(toggle_class)){
      this.classList.remove(toggle_class);
      lettersTransitionState[`${e.target.dataset.letter}`] = true;
    }
  }

  document.addEventListener('mouseover', e => {
    const letter = document.querySelector(`div#${parent_el} div#${containing_el} div[data-letter=${e.target.dataset.letter}]`);
    if (!letter) return;
    if (letter.classList.contains(toggle_class) || lettersTransitionState[`${e.target.dataset.letter}`] === true) return;
    letter.classList.add(toggle_class);
    lettersTransitionState[`${e.target.dataset.letter}`] = true;
  })

  letters.forEach(l => l.addEventListener('transitionend', removeTransition));
}

function init() {
  let element = document.querySelector(`div#content div#title`);
  if (element) {
    element.parentNode.removeChild(element);
  }
  dynamic_hover_chars('content', 'title', 'hovering', 'Cocktailicious')
}
document.addEventListener('DOMContentLoaded', init(), false);

let cells = document.querySelectorAll(".grid-x .cell")

cells.forEach((cell) => {
  cell.setAttribute('data-aos', "zoom-in");
})


var options = {
  strings: ["Try me out ;)", "Search by name", "Or by Ingredient", ""],
  typeSpeed: 25
}
const typed1 = new Typed(".search-input-1", options);
const typed2 = new Typed(".search-input-2", options);


AOS.init();
