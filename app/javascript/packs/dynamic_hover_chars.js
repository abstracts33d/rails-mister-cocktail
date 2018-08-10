
function build_container(parent_el, containing_el) {
  let parent = document.querySelector(`#${parent_el} .first`);
  let container = document.createElement('div');;
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

  function removeTransition(e){
    if (e.propertyName !== 'transform') return;
    this.classList.remove(toggle_class);
  }

  const letters = document.querySelectorAll('.letter');
  document.addEventListener('mouseover', e => {
    const letter = document.querySelector(`div#${parent_el} div#${containing_el} div[data-letter=${e.target.dataset.letter}]`);
    if (!letter) return;
    letter.classList.add(toggle_class);
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
