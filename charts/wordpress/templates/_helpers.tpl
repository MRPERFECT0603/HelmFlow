{{/*
Expand the name of the chart.
Allows nameOverride via values.yaml
*/}}
{{- define "wordpress.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a fully qualified app name.
Allows fullnameOverride via values.yaml
*/}}
{{- define "wordpress.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "wordpress.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/*
Labels shared by all resources
*/}}
{{- define "wordpress.labels" -}}
helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
app.kubernetes.io/name: "{{ include "wordpress.name" . }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
{{- end }}

{{/*
Selector labels (used by Services & Deployments)
These MUST NOT change between upgrades
*/}}
{{- define "wordpress.selectorLabels" -}}
app.kubernetes.io/name: "{{ include "wordpress.name" . }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
{{- end }}