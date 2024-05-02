-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'HEALTHCARE_PROFESSIONAL', 'PATIENT', 'RECEPTIONIST', 'STAFF');

-- CreateTable
CREATE TABLE "patients" (
    "patient_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(3) NOT NULL,
    "gender" TEXT NOT NULL,
    "address" TEXT,
    "phoneNumber" TEXT,
    "email" TEXT,
    "allergies" TEXT,
    "pastIllnesses" TEXT,
    "surgeries" TEXT,
    "policyNumber" TEXT,
    "insuranceProvider" TEXT,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "patients_pkey" PRIMARY KEY ("patient_id")
);

-- CreateTable
CREATE TABLE "healthcareProfissionals" (
    "prof_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "contactDetails" TEXT,
    "licenseNumber" TEXT NOT NULL,
    "specialty" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "healthcareProfissionals_pkey" PRIMARY KEY ("prof_id")
);

-- CreateTable
CREATE TABLE "appointments" (
    "appointment_id" TEXT NOT NULL,
    "dateTime" TIMESTAMP(3) NOT NULL,
    "patientId" TEXT NOT NULL,
    "profId" TEXT NOT NULL,
    "appointmentType" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "appointments_pkey" PRIMARY KEY ("appointment_id")
);

-- CreateTable
CREATE TABLE "clinicalNotes" (
    "clinical_note_id" TEXT NOT NULL,
    "dateTime" TIMESTAMP(3) NOT NULL,
    "profId" TEXT NOT NULL,
    "noteType" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "clinicalNotes_pkey" PRIMARY KEY ("clinical_note_id")
);

-- CreateTable
CREATE TABLE "billingRecords" (
    "billing_record_id" TEXT NOT NULL,
    "encounterDate" TIMESTAMP(3) NOT NULL,
    "patientId" TEXT NOT NULL,
    "servicesProvided" TEXT NOT NULL,
    "insuranceInfo" TEXT,
    "billingStatus" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "billingRecords_pkey" PRIMARY KEY ("billing_record_id")
);

-- CreateTable
CREATE TABLE "prescriptions" (
    "prescription_id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "medicationName" TEXT NOT NULL,
    "dosage" TEXT NOT NULL,
    "frequency" TEXT NOT NULL,
    "route" TEXT NOT NULL,
    "profId" TEXT NOT NULL,
    "prescriptionStatus" TEXT NOT NULL,

    CONSTRAINT "prescriptions_pkey" PRIMARY KEY ("prescription_id")
);

-- CreateTable
CREATE TABLE "labTests" (
    "lab_test_id" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "testType" TEXT NOT NULL,
    "dateTime" TIMESTAMP(3) NOT NULL,
    "results" TEXT NOT NULL,
    "profId" TEXT NOT NULL,

    CONSTRAINT "labTests_pkey" PRIMARY KEY ("lab_test_id")
);

-- CreateTable
CREATE TABLE "imagingstudies" (
    "imagingStudyId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "studyType" TEXT NOT NULL,
    "dateTime" TIMESTAMP(3) NOT NULL,
    "results" TEXT NOT NULL,
    "profId" TEXT NOT NULL,

    CONSTRAINT "imagingstudies_pkey" PRIMARY KEY ("imagingStudyId")
);

-- CreateTable
CREATE TABLE "users" (
    "userId" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "notifications" (
    "notificationId" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "dateTime" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("notificationId")
);

-- CreateTable
CREATE TABLE "payments" (
    "paymentId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "method" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "payments_pkey" PRIMARY KEY ("paymentId")
);

-- CreateTable
CREATE TABLE "receptionists" (
    "receptionistId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "contactDetails" TEXT,
    "userId" TEXT NOT NULL,

    CONSTRAINT "receptionists_pkey" PRIMARY KEY ("receptionistId")
);

-- CreateTable
CREATE TABLE "insurances" (
    "insuranceId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "policyNumber" TEXT NOT NULL,
    "provider" TEXT NOT NULL,

    CONSTRAINT "insurances_pkey" PRIMARY KEY ("insuranceId")
);

-- CreateTable
CREATE TABLE "claims" (
    "claimId" TEXT NOT NULL,
    "patientId" TEXT NOT NULL,
    "claimStatus" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "claims_pkey" PRIMARY KEY ("claimId")
);

-- CreateTable
CREATE TABLE "_AssignedHealthcareProfessionals" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "patients_patient_id_key" ON "patients"("patient_id");

-- CreateIndex
CREATE UNIQUE INDEX "healthcareProfissionals_prof_id_key" ON "healthcareProfissionals"("prof_id");

-- CreateIndex
CREATE UNIQUE INDEX "appointments_appointment_id_key" ON "appointments"("appointment_id");

-- CreateIndex
CREATE UNIQUE INDEX "clinicalNotes_clinical_note_id_key" ON "clinicalNotes"("clinical_note_id");

-- CreateIndex
CREATE UNIQUE INDEX "billingRecords_billing_record_id_key" ON "billingRecords"("billing_record_id");

-- CreateIndex
CREATE UNIQUE INDEX "prescriptions_prescription_id_key" ON "prescriptions"("prescription_id");

-- CreateIndex
CREATE UNIQUE INDEX "labTests_lab_test_id_key" ON "labTests"("lab_test_id");

-- CreateIndex
CREATE UNIQUE INDEX "imagingstudies_imagingStudyId_key" ON "imagingstudies"("imagingStudyId");

-- CreateIndex
CREATE UNIQUE INDEX "users_userId_key" ON "users"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "notifications_notificationId_key" ON "notifications"("notificationId");

-- CreateIndex
CREATE UNIQUE INDEX "payments_paymentId_key" ON "payments"("paymentId");

-- CreateIndex
CREATE UNIQUE INDEX "receptionists_receptionistId_key" ON "receptionists"("receptionistId");

-- CreateIndex
CREATE UNIQUE INDEX "insurances_insuranceId_key" ON "insurances"("insuranceId");

-- CreateIndex
CREATE UNIQUE INDEX "claims_claimId_key" ON "claims"("claimId");

-- CreateIndex
CREATE UNIQUE INDEX "_AssignedHealthcareProfessionals_AB_unique" ON "_AssignedHealthcareProfessionals"("A", "B");

-- CreateIndex
CREATE INDEX "_AssignedHealthcareProfessionals_B_index" ON "_AssignedHealthcareProfessionals"("B");

-- AddForeignKey
ALTER TABLE "patients" ADD CONSTRAINT "patients_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "healthcareProfissionals" ADD CONSTRAINT "healthcareProfissionals_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointments" ADD CONSTRAINT "appointments_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointments" ADD CONSTRAINT "appointments_profId_fkey" FOREIGN KEY ("profId") REFERENCES "healthcareProfissionals"("prof_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "clinicalNotes" ADD CONSTRAINT "clinicalNotes_profId_fkey" FOREIGN KEY ("profId") REFERENCES "healthcareProfissionals"("prof_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "billingRecords" ADD CONSTRAINT "billingRecords_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prescriptions" ADD CONSTRAINT "prescriptions_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "prescriptions" ADD CONSTRAINT "prescriptions_profId_fkey" FOREIGN KEY ("profId") REFERENCES "healthcareProfissionals"("prof_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "labTests" ADD CONSTRAINT "labTests_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "labTests" ADD CONSTRAINT "labTests_profId_fkey" FOREIGN KEY ("profId") REFERENCES "healthcareProfissionals"("prof_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imagingstudies" ADD CONSTRAINT "imagingstudies_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imagingstudies" ADD CONSTRAINT "imagingstudies_profId_fkey" FOREIGN KEY ("profId") REFERENCES "healthcareProfissionals"("prof_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payments" ADD CONSTRAINT "payments_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "receptionists" ADD CONSTRAINT "receptionists_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "insurances" ADD CONSTRAINT "insurances_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "claims" ADD CONSTRAINT "claims_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patients"("patient_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AssignedHealthcareProfessionals" ADD CONSTRAINT "_AssignedHealthcareProfessionals_A_fkey" FOREIGN KEY ("A") REFERENCES "healthcareProfissionals"("prof_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AssignedHealthcareProfessionals" ADD CONSTRAINT "_AssignedHealthcareProfessionals_B_fkey" FOREIGN KEY ("B") REFERENCES "patients"("patient_id") ON DELETE CASCADE ON UPDATE CASCADE;
