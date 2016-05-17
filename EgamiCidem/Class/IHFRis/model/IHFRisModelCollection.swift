//
//  IHFRisModelCollection.swift
//  EgamiCidem
//
//  Created by ihefe－hulinhua on 16/5/16.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

import UIKit

class IHFRisStudyModel: IHFMantleHTL {

    var birthdate = "";
    var exambodypart = ""
    var modality = ""
    var name = ""
    var patientid = ""
    var py = ""
    var regdate = ""
    var regtime = ""
    var reporterid = ""
    var reqdept = ""
    var reqhospital = ""
    var sex = ""
    var studyage = ""
    var studyid = ""
    var studystatus = ""
    var updatetime = ""
    var relatetopacs = ""
    var stu_id = ""
    
    required override init() {
        super.init();
        property = ["birthdate":"","exambodypart":"","modality":"","name":"","patientid":"","py":"","regdate":"","regtime":"","reporterid":"","reqdept":"","reqhospital":"","sex":"","studyage":"","studyid":"","studystatus":"","updatetime":"","relatetopacs":"","stu_id":""]
    }
}
