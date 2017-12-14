import $ from 'jquery';
import 'select2';
$('.select2').select2({
  placeholder: '',
  // multiple: true,
});

// Requiring CSS! Path is relative to ./node_modules
import 'select2/dist/css/select2.css';

$('.select2').on('select2:select', function (e) {
  document.getElementById('submittag').submit();
});
