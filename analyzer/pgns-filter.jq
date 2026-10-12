{
  PGNs: (.PGNs | map(
    del(.Description, .Complete, .Fallback, .Explanation, .FieldCount,
        .MinLength, .Missing, .Priority, .TransmissionInterval,
        .TransmissionIrregular, .RepeatingFieldSet1StartField,
        .RepeatingFieldSet2CountField, .RepeatingFieldSet2Size,
        .RepeatingFieldSet2StartField, .MaxValue, .URL)
    | .Fields |= map(
        del(.Order, .BitOffset, .BitStart, .Condition, .PhysicalQuantity,
            .PartOfPrimaryKey, .LookupIndirectEnumeration,
            .LookupIndirectEnumerationFieldOrder, .BitLengthField,
            .Complete, .Fallback, .Explanation, .FieldCount, .MinLength,
            .Missing, .Priority, .TransmissionInterval,
            .TransmissionIrregular, .RepeatingFieldSet1StartField,
            .RepeatingFieldSet2CountField, .RepeatingFieldSet2Size,
            .RepeatingFieldSet2StartField, .MaxValue, .Name)
        | if has("Match") then . else del(.Description) end
      )
  )),
  LookupEnumerations:          (.LookupEnumerations          | map(del(.MaxValue, .Description, .Comment))),
  LookupBitEnumerations:       (.LookupBitEnumerations       | map(del(.MaxValue, .Description, .Comment))),
  LookupFieldTypeEnumerations: (.LookupFieldTypeEnumerations | map(del(.MaxValue, .Description, .Comment)))
}