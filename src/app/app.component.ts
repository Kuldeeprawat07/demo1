import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'demo-ng-app2';

  raiseError() {
    throw new Error('Oops something went wrong');
  }
}
