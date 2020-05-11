import { render } from 'timeago.js';

document.addEventListener('turbolinks:load', () => {
  const timeagoNodes = document.querySelectorAll('time.timeago');
  if (timeagoNodes.length > 0) render(timeagoNodes);
});
