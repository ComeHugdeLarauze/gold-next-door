import "bootstrap";

import { initPickTypeAbordage } from '../components/type-picker';
if (document.getElementById("abordage_type_abordage")) {
  initPickTypeAbordage();
};

import { clickcoffre } from "../components/coffre";
if (document.getElementById('tresor_prive_true')){
  clickcoffre();
};

import { clickcrew } from '../components/crew';
if (document.getElementById('crew_prive_true')){
  clickcrew();
};

import { initModal } from "../components/modal-closer";
if (document.getElementById('new-abordage-modal_btn')){
  initModal();
};

import { selectcrew } from "../components/select-crew";
if (document.getElementById('crewcheckbox')){
  selectcrew();
};

import { updateprofil } from "../components/updatprofil";
if (document.getElementById('torender')){
  updateprofil();
};

import '../components/select2';

import { crewselected} from "../components/crewselected";
if (document.getElementById('query')){
  updateprofil();
};
