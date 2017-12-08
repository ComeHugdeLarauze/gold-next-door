import "bootstrap";

import { initPickTypeAbordage } from '../components/type-picker';
if (document.getElementById("abordage_type_abordage")) {
  initPickTypeAbordage();
};


import { clickcoffre } from "../components/coffre";
if (document.getElementById('tresor_prive_true')){
  clickcoffre();
};

