import { alpha, compare, email, file, maxDate, prop, propArray, required } from "@rxweb/reactive-form-validators";

export class FakeUser {
     name:string;
     email:string;
}

export class User{
     @alpha({message:"Only alphabets are allowed."})
     @required({message:"Firstname is required."})
     firstName : string = '';

     @prop()
    
     lastName:string ='';

     @prop()

     password:string='';

     @compare({fieldName:"password"})
     cpassword:string = '';

     @email()
     email:string='';

     @prop()
     city:string='';
     
     @prop()
     state:string='';

     @prop()
     zip:string='';

     @maxDate({value:new Date(), message:"Date should be less than current date."})
     maxDate:string;

     // @fileSize({maxSize:10 ,message:"Size exceeded."})
     @file({maxFiles:2, message:"More than 2 files are not allowed."})
     totalDocumentFiles:any;

}