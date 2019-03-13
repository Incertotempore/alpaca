import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';


import flatpickr from 'flatpickr'
import "flatpickr/dist/flatpickr.min.css"

flatpickr(".datepicker", {});

initMapbox();



