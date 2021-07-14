import { HttpClient, HttpHeaders } from "@angular/common/http";
import { FormControl } from "@angular/forms";
import { alpha, async, compare, email, file, fileSize, maxDate, prop, propArray, required } from "@rxweb/reactive-form-validators";
import { UserService } from "src/app/user.service";

export class Address {
     @prop()
     city:string;
     
     @prop()
     country:string;
}

export class User {

     @alpha({message:"Only alphabets are allowed."})
     @required({message:"Firstname is required."})
     firstName : string;

     @required()
     lastName:string;

     @required()
     password:string;

     @compare({fieldName:"password"})
     cpassword;

     @email()
     @async([ User.isUniqueEmail ]) 
     email:string;

     @prop()
     city:string;

     @prop()
     state:string;

     @prop()
     zip:string;

     @maxDate({value:new Date(), message:"Date should be less than current date."})
     maxDate:string;

     // @fileSize({maxSize:10 ,message:"Size exceeded."})
     @file({maxFiles:2, message:"More than 2 files are not allowed."})
     totalDocumentFiles;

     @propArray(Address)
     addresses: Address[];


     static isUniqueEmail(control: FormControl) {
          const promise = new Promise((resolve, reject) => {
               if (!control.value == false)
               resolve(null)
               else
               resolve({ 'async':{message: 'You must enter a value'} })
          });
          return promise;
     }
     
}