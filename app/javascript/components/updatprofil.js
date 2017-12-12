function updateprofil () {
  const prive = document.getElementById('modify');
  const torender = document.getElementById('torender');

  prive.addEventListener('click', (s) => {
    torender.classList.toggle("hidden");
    console.log(prive);
  });
}

export { updateprofil };
