import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import { start as ActiveStorageStart } from '@rails/activestorage';
import 'bootstrap/dist/js/bootstrap.bundle';
import './ga';
import './render_timeago';

Rails.start();
Turbolinks.start();
ActiveStorageStart();
