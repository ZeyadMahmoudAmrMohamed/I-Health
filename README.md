# On Demand Health Service Application

## A. Problem Statement

The traditional way of attaining health services is the patient needs to go to a hospital and stand in a queue to pay for the service he or she wants. When queues are long, patients might not have the opportunity to get the desired service or with the same quality. On Demand Health service application system replicates the activities each role performs through a web application, which results in efficiency and comfort to several customers. The main purpose of hospitals and health clinics is to provide top quality health services for each patient. Traditionally, when hospitals are crowded, critical cases are the ones who will be heavily affected because in the case of saving lives, time is money. The health service system will be invoked for the following functions:

- Booking a medical or blood donation appointment, whether physical or online.
- Viewing health documents of any time such as doctor prescriptions.
- Ordering medical items from the online pharmacy store.


![doctorHomepage](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/446c80ae-ab6a-4af9-a885-b50ada390fc8)

### Patient and Doctor Registration:
![doctorSingUpFilled](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/884e6e1d-84bb-4c09-b44f-8231712b3308)

For first-time users, whether doctors or patients, the system will prompt them to register an account to access the web application. The basic information required to enter from either a patient or a doctor is their full name, national ID, username, and password. For specific information, however, a patient will be asked to enter his/her birthdate, blood type, chronic diseases (if any), insurance info (if any), and credit card info. Doctors, on the other hand, will be prompted to enter their specialization and clinic locations. The information will then be validated through the database, and the appropriate action will be done accordingly.

![patientSignUp](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/c8348031-8a94-4a12-bdd5-c3445b88d467)

### Login
![SignIn](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/4fb2f2b1-155e-4e0d-89c9-275be4f2f104)

The user logs in to the web application through the unique username and password. If the user forgot their password, he/she will be redirected to a page to validate his/her identity and change the password.

![SingInFilled](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/7a83f4b1-e4ce-4a68-950f-ba9ce5c6d334)

### Checking for Appointments

The patient will have the luxury to view the available appointments delivered by each doctor through our website. The appointment types available in our system are physiotherapy, ENT, dental, therapy, lab tests, and blood donations, whether the patient is a donor or recipient.

### Schedule Appointment

After checking the available appointments, the patient could schedule an appointment, whether physical or online, through clicking the book button. If the case is urgent, the patient could notify the doctor to receive priority treatment.

### Check for Available Medicine in Store

Patients could simply browse for their desired medical item from our online pharmacy store whose database is constantly updated by the admin.

### Put Medicine in Online Bag

Patients could store items they want to purchase in the online bag available in the online pharmacy store.

### Online Pharmacy Checkout

After selecting all the desired items, patients will click on a checkout button that redirects them to the checkout page. In the checkout page, the patient will review the order, then click on the payment button.

### Payment & Discounts

![insertCredit](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/28d2563c-692e-408c-ae94-4a3015df29a9)
After clicking the payment button, the patient could receive a discount if he/she is covered by insurance.

### Make Payment

The last step of the transactions is done when the patient chooses whether he or she wants to pay with a card or cash. If the patient chooses to pay with a card, he/she will pay with the card stored in the database; if not, the system will generate a code to allow the patient to pay the fees physically.

### Give Feedback

The patient could rate the doctor’s performance after each appointment.

### Access Patient Info

One of the features doctors have in our system is that it allows doctors to view certain patient info such as their names, birthdates, blood types, and chronic diseases.

### Doctor Appointment Actions

Doctors can create, reschedule, and cancel appointments for patients. Any action performed by the doctor will be notified to the patient through the email.

### Upload Documents

![doctorUploadDocument](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/52151883-691e-47ec-a10c-ccabd2645e08)

Only doctors have the privilege to upload documents in the system. The documents are either prescriptions or lab results.

### Modify Online Store

Only admins have the privilege to add, delete, and change the price of a pharmacy item from the database.

### Delete Account

To save database storage, admins have the privilege to delete unnecessary accounts from the database. This happens only in the case of a patient or doctor passes away.

## B. Use Case Diagram and Sequence Diagram
![UseCaseMisuseCase](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/c7f4ff29-1f53-4c2c-a3a4-e4d3ae8751f0)
## C. Entity Relationship Diagram
![erdFinal](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/8675cbc3-d60f-4b8c-acf6-d8c752b29d32)
## D. Class Diagram
![Class Diagram](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/a4a750d3-b909-416d-b63a-6513d5af95e8)
## E. Sequence Diagram
![sequence](https://github.com/ZeyadMahmoudAmrMohamed/I-Health/assets/145808463/07d819dd-dc91-4d75-a223-add6b921a628)



