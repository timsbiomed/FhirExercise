#!/usr/bin/env bash

if (( 0 )) ; then 
   ./post_organization.sh
    sleep 3
fi
ORGANIZATION_ID=`grep \"id\" post_organization.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
echo "Organization: $ORGANIZATION_ID"

if (( 1 )) ; then 
    ./post_patient_1.sh $ORGANIZATION_ID
    sleep 3

    if [[ `grep ERROR post_patient_1.txt | wc -l ` > 1 ]]; then
        echo "ERROR with posting patient 1"
        grep ERROR post_patient_1.txt 
        exit 1
    else 
       PERSON_1_ID=`grep \"id\" post_patient_1.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
       echo "Patient 1: $PERSON_1_ID"
    fi
else
       PERSON_1_ID=`grep \"id\" post_patient_1.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
       echo "Patient 1: $PERSON_1_ID"
fi

if (( 1 )) ; then 
    ./post_patient_2.sh $ORGANIZATION_ID
    sleep 3

    if [[ `grep ERROR post_patient_1.txt | wc -l ` > 1 ]]; then
        echo "ERROR with posting patient 2"
        grep ERROR post_patient_2.txt 
        exit 1
    else 
        PERSON_2_ID=`grep \"id\" post_patient_2.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
        echo "Patient 2: $PERSON_2_ID"
    fi
else
        PERSON_2_ID=`grep \"id\" post_patient_2.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
        echo "Patient 2: $PERSON_2_ID"
fi

if (( 1 )) ; then 
    ./post_patient_erroneous.sh $ORGANIZATION_ID
    sleep 3

    if [[ `grep ERROR post_patient_erroneous.txt | wc -l ` > 1 ]]; then
        echo "ERROR with posting patient erroneous"
        grep ERROR post_patient_erroneous.txt 
        exit 1
    else 
        PERSON_ERR_ID=`grep \"id\" post_patient_erroneous.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
        echo "Patient 2: $PERSON_ERR_ID"
    fi
else
        PERSON_ERR_ID=`grep \"id\" post_patient_erroneous.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
        echo "Patient 2: $PERSON_ERR_ID"
fi


if (( 1 )) ; then 
    echo "WTF $PERSON_1_ID"
    ./post_encounter.sh $PERSON_1_ID
    sleep 3
    ENCOUNTER_ID=`grep \"id\" post_encounter.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
    echo "ENCOUNTER $ENCOUNTER_ID"
else
    ENCOUNTER_ID=`grep \"id\" post_encounter.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
    echo "ENCOUNTER $ENCOUNTER_ID"
fi

