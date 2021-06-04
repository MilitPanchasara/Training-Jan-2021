import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthService } from 'src/app/services/auth.service';
import { RiderService } from '../rider.service';
import * as CryptoJS from 'crypto-js';
import { Router } from '@angular/router';
import { GlobalConstants } from 'src/app/common/global-constants';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {
  signUpForm:FormGroup;
  submitingForm:boolean = false;

  constructor(private fb:FormBuilder, private router:Router, private riderService:RiderService, private authService:AuthService) {
    this.signUpForm = this.fb.group({
      firstName: ['', Validators.compose([Validators.required, Validators.pattern(/^[A-Za-z]+$/)])],
      surName: ['', Validators.compose([Validators.required, Validators.pattern(/^[A-Za-z]+$/)])],
      contactNumber: ['',  Validators.compose([Validators.required, Validators.pattern(/^[0-9]{10,10}$/)])],
      email: ['', Validators.compose([Validators.required, Validators.email])],
      password:['',Validators.compose([Validators.required])]
    });
   }

  ngOnInit(): void {
    
  }

  submitForm() {
    this.submitingForm = true;
    this.authService.registerRider(this.signUpForm.value)
    .subscribe(x => {
      let encryptedUser = (CryptoJS.AES.encrypt(JSON.stringify(x), GlobalConstants.cryptoPassword)).toString();
      localStorage.setItem('user',encryptedUser);
      
      this.riderService.getProfileData().subscribe(x => {
        this.riderService.setData(x);
      },
      error => {
        if(error.status == 0) {
          // alert("Something went wrong!");
          this.router.navigate(['/']);
        }
      });
      this.submitingForm = false;
      this.router.navigate(['/rider/dashboard']);
      this.riderService.sendVerificationMail();
    },
    error => {
      alert("Something went wrong!");
      this.submitingForm = false;
    });
  }
}
