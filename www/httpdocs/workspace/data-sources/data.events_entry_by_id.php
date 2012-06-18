<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceevents_entry_by_id extends Datasource{

		public $dsParamROOTELEMENT = 'events-entry-by-id';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$pt3';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$pt3}',
				'213' => 'no',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'name',
				'name: raw',
				'date',
				'description',
				'description: raw',
				'location: name-formal',
				'location: name-formal: raw',
				'location: name-casual',
				'location: name-casual: raw',
				'location: description',
				'location: description: raw',
				'location: address',
				'location: city',
				'location: state',
				'location: zip',
				'location: latitude',
				'location: longitude',
				'location: tags: tag',
				'location: tags: tag: raw',
				'location: tags: description',
				'location: tags: description: raw',
				'location: tags: slug',
				'location: tags: layout: name',
				'location: tags: layout: name: raw',
				'location: tags: layout: column-full-width: label',
				'location: tags: layout: column-full-width: label: raw',
				'location: tags: layout: column-full-width: hide',
				'location: tags: layout: column-center: label',
				'location: tags: layout: column-center: label: raw',
				'location: tags: layout: column-center: hide',
				'location: tags: layout: column-right: label',
				'location: tags: layout: column-right: label: raw',
				'location: tags: layout: column-right: hide',
				'location: tags: layout: hide',
				'location: tags: parent: tag',
				'location: tags: parent: tag: raw',
				'location: tags: parent: description',
				'location: tags: parent: description: raw',
				'location: tags: parent: slug',
				'location: tags: parent: order',
				'location: tags: parent: hide-from-header',
				'location: tags: parent: hide-from-footer',
				'location: tags: parent: hide',
				'location: tags: order',
				'location: tags: hide-from-header',
				'location: tags: hide-from-footer',
				'location: tags: hide',
				'location: hide',
				'member-role: member: first-name',
				'member-role: member: last-name',
				'member-role: member: photo',
				'member-role: member: email',
				'member-role: member: job-title',
				'member-role: member: job-title: raw',
				'member-role: member: gender',
				'member-role: member: birthday',
				'member-role: member: password',
				'member-role: member: activation',
				'member-role: member: about',
				'member-role: member: about: raw',
				'member-role: member: tags: tag',
				'member-role: member: tags: tag: raw',
				'member-role: member: tags: description',
				'member-role: member: tags: description: raw',
				'member-role: member: tags: slug',
				'member-role: member: tags: layout: name',
				'member-role: member: tags: layout: name: raw',
				'member-role: member: tags: layout: column-full-width: label',
				'member-role: member: tags: layout: column-full-width: label: raw',
				'member-role: member: tags: layout: column-full-width: hide',
				'member-role: member: tags: layout: column-center: label',
				'member-role: member: tags: layout: column-center: label: raw',
				'member-role: member: tags: layout: column-center: hide',
				'member-role: member: tags: layout: column-right: label',
				'member-role: member: tags: layout: column-right: label: raw',
				'member-role: member: tags: layout: column-right: hide',
				'member-role: member: tags: layout: hide',
				'member-role: member: tags: parent: tag',
				'member-role: member: tags: parent: tag: raw',
				'member-role: member: tags: parent: description',
				'member-role: member: tags: parent: description: raw',
				'member-role: member: tags: parent: slug',
				'member-role: member: tags: parent: order',
				'member-role: member: tags: parent: hide-from-header',
				'member-role: member: tags: parent: hide-from-footer',
				'member-role: member: tags: parent: hide',
				'member-role: member: tags: order',
				'member-role: member: tags: hide-from-header',
				'member-role: member: tags: hide-from-footer',
				'member-role: member: tags: hide',
				'member-role: member: order',
				'member-role: member: phone-number',
				'member-role: member: anonymize',
				'member-role: member: hide',
				'member-role: role: role',
				'member-role: role: role: raw',
				'member-role: role: context',
				'member-role: role: context: raw',
				'member-role: role: description',
				'member-role: role: description: raw',
				'member-role: role: hide',
				'member-role: tags: tag',
				'member-role: tags: tag: raw',
				'member-role: tags: description',
				'member-role: tags: description: raw',
				'member-role: tags: slug',
				'member-role: tags: layout: name',
				'member-role: tags: layout: name: raw',
				'member-role: tags: layout: column-full-width: label',
				'member-role: tags: layout: column-full-width: label: raw',
				'member-role: tags: layout: column-full-width: hide',
				'member-role: tags: layout: column-center: label',
				'member-role: tags: layout: column-center: label: raw',
				'member-role: tags: layout: column-center: hide',
				'member-role: tags: layout: column-right: label',
				'member-role: tags: layout: column-right: label: raw',
				'member-role: tags: layout: column-right: hide',
				'member-role: tags: layout: hide',
				'member-role: tags: parent: tag',
				'member-role: tags: parent: tag: raw',
				'member-role: tags: parent: description',
				'member-role: tags: parent: description: raw',
				'member-role: tags: parent: slug',
				'member-role: tags: parent: order',
				'member-role: tags: parent: hide-from-header',
				'member-role: tags: parent: hide-from-footer',
				'member-role: tags: parent: hide',
				'member-role: tags: order',
				'member-role: tags: hide-from-header',
				'member-role: tags: hide-from-footer',
				'member-role: tags: hide',
				'member-role: hide',
				'member-role: order',
				'tags: tag',
				'tags: tag: raw',
				'tags: description',
				'tags: description: raw',
				'tags: slug',
				'tags: layout: name',
				'tags: layout: name: raw',
				'tags: layout: column-full-width: label',
				'tags: layout: column-full-width: label: raw',
				'tags: layout: column-full-width: hide',
				'tags: layout: column-center: label',
				'tags: layout: column-center: label: raw',
				'tags: layout: column-center: hide',
				'tags: layout: column-right: label',
				'tags: layout: column-right: label: raw',
				'tags: layout: column-right: hide',
				'tags: layout: hide',
				'tags: parent: tag',
				'tags: parent: tag: raw',
				'tags: parent: description',
				'tags: parent: description: raw',
				'tags: parent: slug',
				'tags: parent: order',
				'tags: parent: hide-from-header',
				'tags: parent: hide-from-footer',
				'tags: parent: hide',
				'tags: order',
				'tags: hide-from-header',
				'tags: hide-from-footer',
				'tags: hide',
				'type: type',
				'type: type: raw',
				'type: description',
				'type: description: raw',
				'type: hide',
				'childcare',
				'filter',
				'hide'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Events: Entry by ID',
				'author' => array(
					'name' => 'Kirk Strobeck',
					'website' => 'http://atheycreek',
					'email' => 'kirk@strobeck.com'),
				'version' => 'Symphony 2.2.5',
				'release-date' => '2012-06-17T03:38:30+00:00'
			);
		}

		public function getSource(){
			return '6';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
