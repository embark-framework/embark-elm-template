import EmbarkJS from 'Embark/EmbarkJS';

// import your contracts
// e.g if you have a contract named SimpleStorage:
//import SimpleStorage from 'Embark/contracts/SimpleStorage';

// inject bundled Elm app into div#main
import {Elm} from '../elm/Main';

const app = Elm.Main.init({node: document.getElementById('main')});

EmbarkJS.onReady(error => {
  app.ports.embarkReady.send(error || '');
});