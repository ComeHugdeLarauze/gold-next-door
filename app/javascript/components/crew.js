function clickcrew () {
  const prive = document.getElementById('crew_prive_true');
  const publique = document.getElementById('crew_prive_false');
  const indice = document.getElementById('password_indice');

  prive.addEventListener('click', (s) => {
    prive.checked = true;
    indice.classList.remove("hidden");
    console.log(prive);
  });

  publique.addEventListener('click', (s) => {
    publique.checked = true;
    indice.classList.add("hidden");
    console.log(publique);
  });
}

export { clickcrew };

