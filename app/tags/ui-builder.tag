<ui-builder>

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-11"></div>
      <div class="col-md-1 edit-bar">
        <a class="btn btn-default btn-circle pull-right" href="#" role="button" onclick={ edit }><span class="fa fa-edit"></span></a>
      </div>
    </div>
    <div class="row" if={ debug }>
      <div class={'ui-builder': true, 'editing': editing}>
        <pre if={ editing }>Editing</pre>
        <pre if={ !editing }>Not editing</pre>
      </div>
    </div>
    <row each={ row in model.rows }>
      <column each={ column in row.columns }>
        <block each={ column.blocks }>

        </block>
        <column if={ editing }>
          <a class="btn btn-default btn-circle" href="#" role="button" onclick={ addBlock( column.blocks ) }><span class="fa fa-plus"></span></a>
        </column>
      </column>
      <column if={ editing }>
        <a class="btn btn-default btn-circle" href="#" role="button" onclick={ addColumn( row.columns ) }><span class="fa fa-plus"></span></a>
      </column>
    </row>
    <row if={ editing }>
      <column>
        <a class="btn btn-default btn-circle" href="#" role="button" onclick={ addRow }><span class="fa fa-plus"></span></a>
      </column>
    </row>

  </div>


  <script>
    var self = this

    opts.tag.skipRootNode = true
    
    self.editing = false
    self.debug = opts.debug
    self.model = { rows: [] }

    edit() {
      self.editing = !self.editing
    }

    addRow() {
      self.model.rows.push( { blocks: [] } )
    }

    addColumn( columns ) {
      columns.push( { columns: [] } )
    }

    addBlock( blocks ) {
      blocks.push( {  } )
    }

  </script>
</ui-builder>
