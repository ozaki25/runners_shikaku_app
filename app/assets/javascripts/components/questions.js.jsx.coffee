@Question = React.createClass
  getInitialState: ->
    return {
      question: @props.question
      classification: @props.classification
    }
  render: ->
    headerMessage = "#{@state.classification.category} 第#{@state.classification.timeOfCategory}回"
    return(
      `<div className="panel panel-info">
        <QuestionHeader headerMessage={headerMessage} />
        <div className="panel-body">
          <img src={this.state.question.question_path} alt={this.state.question.question_path} />
        </div>
      </div>`
    )

@QuestionHeader = React.createClass
  render: ->
    headerMessage = this.props.headerMessage
    return(
      `<div className="panel-heading">
        <strong>{headerMessage}</strong>
      </div>`
    )
