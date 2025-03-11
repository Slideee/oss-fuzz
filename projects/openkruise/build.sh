#!/bin/bash -eu
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

set -o nounset
set -o pipefail
set -o errexit
set -x

go clean --modcache
go mod tidy
go mod vendor

rm -r $SRC/kruise/vendor
go get github.com/AdamKorcz/go-118-fuzz-build/testing


#compile_native_go_fuzzer $SRC/kruise/pkg/controller/workloadspread FuzzPatchFavoriteSubsetMetadataToPod fuzz_patch_favorite_subset_metadata_to_pod
#compile_native_go_fuzzer $SRC/kruise/pkg/controller/workloadspread FuzzPodPreferredScore fuzz_pod_preferred_score
#
#compile_native_go_fuzzer $SRC/kruise/pkg/util/workloadspread FuzzInjectWorkloadSpreadIntoPod fuzz_inject_workloadspread_into_pod
#compile_native_go_fuzzer $SRC/kruise/pkg/util/workloadspread FuzzNestedField fuzz_nested_field
#compile_native_go_fuzzer $SRC/kruise/pkg/util/workloadspread FuzzIsPodSelected fuzz_is_pod_selected
#compile_native_go_fuzzer $SRC/kruise/pkg/util/workloadspread FuzzHasPercentSubset fuzz_has_percent_subset

compile_native_go_fuzzer $SRC/kruise/pkg/webhook/workloadspread/validating FuzzValidateWorkloadSpreadSpec fuzz_validate_workloadspread_spec
#compile_native_go_fuzzer $SRC/kruise/pkg/webhook/workloadspread/validating FuzzValidateWorkloadSpreadSubsets fuzz_validate_workloadspread_subsets
#compile_native_go_fuzzer $SRC/kruise/pkg/webhook/workloadspread/validating FuzzValidateWorkloadSpreadConflict fuzz_validate_workloadspread_conflict
#compile_native_go_fuzzer $SRC/kruise/pkg/webhook/workloadspread/validating FuzzValidateWorkloadSpreadTargetRefUpdate fuzz_validate_workloadspread_target_ref_update





