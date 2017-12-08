function clickcoffre () {
  const prive = document.getElementById('tresor_prive_true');
  const publique = document.getElementById('tresor_prive_false');
  const indice = document.getElementById('indice');

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

export { clickcoffre };

