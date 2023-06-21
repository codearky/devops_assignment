{{/*
Expand the name of the chart.
*/}}
{{- define "devops-ass.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "devops-ass.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "devops-ass.dbServiceName" -}}
postgres
{{- end}}

{{- define "devops-ass.dbSecretName" -}}
postgres-secret
{{- end}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "devops-ass.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "devops-ass.labels" -}}
helm.sh/chart: {{ include "devops-ass.chart" . }}
{{ include "devops-ass.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "devops-ass.selectorLabels" -}}
app.kubernetes.io/name: {{ include "devops-ass.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
appType: app
{{- end }}

{{- define "devops-ass.dbSelectorLabels" -}}
app.kubernetes.io/name: {{ include "devops-ass.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
appType: db
{{- end }}


