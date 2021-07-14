import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { anonymous, middleware } from '@rxweb/angular-router';
import { RxFormBuilder } from '@rxweb/reactive-form-validators';
import { LoggedInMiddleware } from 'src/app/domain/security/middlewares/loggin.middleware';
import { BrowserStorage } from 'src/app/domain/services/browser-storage';
import { UserCredentialModel } from './login.model';
import { LoginService } from './login.service';

@middleware([LoggedInMiddleware])
@anonymous()
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {
  loginFormGroup: FormGroup;

  constructor(private formBuilder: RxFormBuilder, private router: Router, private storageHelper: BrowserStorage) { 
  }

  ngOnInit(): void {
    this.loginFormGroup = this.formBuilder.formGroup(UserCredentialModel);
  }

  OnSubmit() {
    this.storageHelper.local.save('auth', 'response_token', false);
    this.storageHelper.local.save('key', 'response_key', false);
    this.router.navigate(['/dashboard']);
  }

}
