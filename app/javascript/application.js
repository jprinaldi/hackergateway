import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import { start as ActiveStorageStart } from '@rails/activestorage';
import 'bootstrap/dist/js/bootstrap.bundle';
import './ga';
import './render_timeago';

Rails.start();
Turbolinks.start();
ActiveStorageStart();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
