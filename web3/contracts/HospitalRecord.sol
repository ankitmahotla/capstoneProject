// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract HospitalRecord {
    // struct HospInfo {
    //     string name;
    //     string cnpj;
    //     address hospAdd;
    // }

    // struct Record {
    //     HospInfo responsibleHospital; // hospital that made/updated the record
    //     string treatments; // previus patient treatments
    //     string medicationHistory;
    //     string allergies;
    //     uint256 date; // register date;
    // }

    struct Report {
        string name;
        string age;
        string contact;
        string gender;
        string city;
        string prevDoctor;
        string bloodGroup;
        string symptoms;
    }

    mapping(uint256 => Report) public reports;

    uint256 public patientReports = 0;

    function setReport(
        string memory _name,
        string memory _age,
        string memory _contact,
        string memory _gender,
        string memory _city,
        string memory _prevDoctor,
        string memory _bloodGroup,
        string memory _symptoms
    ) public returns (uint256) {
        Report storage report = reports[patientReports];

        report.name = _name;
        report.age = _age;
        report.contact = _contact;
        report.gender = _gender;
        report.city = _city;
        report.prevDoctor = _prevDoctor;
        report.bloodGroup = _bloodGroup;
        report.symptoms = _symptoms;

        patientReports++;
        return patientReports - 1;
    }

    function getReport(uint256 reportId)
        public
        view
        returns (
            string memory name,
            string memory age,
            string memory contact,
            string memory gender,
            string memory city,
            string memory prevDoctor,
            string memory bloodGroup,
            string memory symptoms
        )
    {
        Report memory report = reports[reportId];
        name = report.name;
        age = report.age;
        contact = report.contact;
        gender = report.gender;
        city = report.city;
        prevDoctor = report.prevDoctor;
        bloodGroup = report.bloodGroup;
        symptoms = report.symptoms;
    }

    struct Doctor {
        string name;
        string experience;
        string field;
    }

    mapping(uint256 => Doctor) public doctors;

    uint256 public doctorRecord = 0;

    function setDoctor(
        string memory _name,
        string memory _experience,
        string memory _field
    ) public returns (uint256) {
        Doctor storage doctor = doctors[doctorRecord];

        doctor.name = _name;
        doctor.experience = _experience;
        doctor.field = _field;

        doctorRecord++;
        return doctorRecord - 1;
    }

    function getDoctor(uint256 doctorId)
        public
        view
        returns (
            string memory name,
            string memory experience,
            string memory field
        )
    {
        Doctor memory doctor = doctors[doctorId];
        name = doctor.name;
        experience = doctor.experience;
        field = doctor.field;
    }

    // reports[patientID] = [record1,record2,...]
    // mapping(string => Report[]) reports; //medical report for each hospital visit
    // // patientRecord[patientID] = Record
    // mapping(string => Record) patientRecord;

    // address contractOwner;
    // mapping(address => HospInfo) registeredHosp;
    // address[] hospitals; // array of registered hospitals address

    // constructor() {
    //     contractOwner = msg.sender;
    // }

    // // emited when a hospital is removed
    // event removed(address hospital);
    // // emited when business owner change
    // event ownerChanged(address oldOwner, address newOwner);

    // // Only allow the owner to do something
    // modifier isOwner(address sender) {
    //     require(
    //         sender == contractOwner,
    //         "Only the contract onwer can register new hospitals"
    //     );
    //     _;
    // }

    // // Check if the hospital is not registered yet
    // modifier notRegistered(address hospital) {
    //     bool flag = false;
    //     for (uint256 i = 0; i < hospitals.length; i++) {
    //         if (hospitals[i] == hospital) {
    //             flag = true;
    //             break;
    //         }
    //     }
    //     require(flag == false, "Hospital already registered");
    //     _;
    // }

    // // Check if the hospital is already registered
    // modifier isRegistered(address hospital) {
    //     bool flag = false;
    //     for (uint256 i = 0; i < hospitals.length; i++) {
    //         if (hospitals[i] == hospital) {
    //             flag = true;
    //             break;
    //         }
    //     }
    //     require(flag == true, "Hospital not registered");
    //     _;
    // }

    // // Register a new hospital to the network
    // function registerHospital(
    //     string memory name,
    //     string memory cnpj,
    //     address hospAdd
    // ) public isOwner(msg.sender) notRegistered(hospAdd) {
    //     registeredHosp[hospAdd].name = name;
    //     registeredHosp[hospAdd].cnpj = cnpj;
    //     registeredHosp[hospAdd].hospAdd = hospAdd;
    //     hospitals.push(hospAdd);
    // }

    // // Get hospital infos based on their PK
    // function returnHospital(address hospAdd)
    //     private
    //     view
    //     isRegistered(hospAdd)
    //     returns (HospInfo memory h)
    // {
    //     h = registeredHosp[hospAdd];
    // }

    // // Get hospital infos based on their PK
    // function getHospital(address hospAdd)
    //     public
    //     view
    //     isRegistered(hospAdd)
    //     returns (string memory _name, string memory _cnpj)
    // {
    //     _name = registeredHosp[hospAdd].name;
    //     _cnpj = registeredHosp[hospAdd].cnpj;
    // }

    // // Remove a hospital from the network
    // function removeHospital(address hospAdd) public isOwner(msg.sender) {
    //     // find the hospital to be deleted and do it
    //     // move the last element to the deleted position so it does not leave a gap
    //     for (uint256 i = 0; i < hospitals.length; i++) {
    //         if (hospitals[i] == hospAdd) {
    //             hospitals[i] = hospitals[hospitals.length - 1];
    //             delete hospitals[hospitals.length - 1];
    //             // hospitals.length--;
    //             break;
    //         }
    //     }
    //     delete registeredHosp[hospAdd];
    //     emit removed(hospAdd);
    // }

    // // Lists all the participant hospitals
    // function listHospitals() public view returns (address[] memory) {
    //     return hospitals;
    // }

    // // Creates a new record for a patient
    // // function setRecord(
    // //     string memory patientID,
    // //     string memory treatments,
    // //     string memory medicationHistory,
    // //     string memory allergies,
    // //     uint256 date
    // // ) public isRegistered(msg.sender) {
    // //     HospInfo memory h = returnHospital(msg.sender);
    // //     patientRecord[patientID] = Record(
    // //         h,
    // //         treatments,
    // //         medicationHistory,
    // //         allergies,
    // //         date
    // //     );
    // // }

    // // Get the record infos
    // // function getRecord(string memory patientID)
    // //     public
    // //     view
    // //     returns (Record memory)
    // // {
    // //     return patientRecord[patientID];
    // // }

    // // Change business owner
    // function changeOwner(address newOwner) public isOwner(msg.sender) {
    //     address oldOwner = contractOwner;
    //     contractOwner = newOwner;
    //     emit ownerChanged(oldOwner, newOwner);
    // }

    // // function setReport(string memory patientID, string memory doctorName,
    // // string memory description, string memory exams, string memory medicines, uint height,
    // // uint weight, uint bodyTemperature, string memory bloodPreassure, uint256 date)
    // // public isRegistered(msg.sender){
    // //     HospInfo memory h = returnHospital(msg.sender);
    // //     reports[patientID].push(Report(h,doctorName,description,exams,medicines, height, weight,bodyTemperature,bloodPreassure,date));
    // // }

    // function getReports(string memory patientID)
    //     public
    //     view
    //     returns (Report[] memory)
    // {
    //     Report[] memory r = reports[patientID];
    //     return r;
    // }
}
