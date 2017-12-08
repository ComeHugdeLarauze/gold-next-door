import "bootstrap";

import { initPickTypeAbordage } from '../components/type-picker';
if (document.getElementById("abordage_type_abordage")) {
  initPickTypeAbordage();
};


import { clickcoffre } from '../components/coffre';
if (document.getElementById('tresor_prive_true')){
  clickcoffre();
};

import { clickcrew } from '../components/crew';
if (document.getElementById('crew_prive_true')){
  clickcrew();
};
