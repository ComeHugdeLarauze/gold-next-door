function clickcoffre () {
  const prive = document.getElementById('tresor_prive_true')
  const publique = document.getElementById('tresor_prive_false')
  const indice = document.getElementById('indice')

  prive.addEventListener('click', (s) => {
    s.preventDefault();
    prive.classList.add("indice");
    publique.classList.remove("indice")
    indice.classList.remove("hidden")
  });

  publique.addEventListener('click', (s) => {
    s.preventDefault();
    publique.classList.add("indice");
    prive.classList.remove("indice")
    indice.classList.add("hidden")
  });
}

export { clickcoffre };

