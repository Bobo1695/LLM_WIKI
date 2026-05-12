---
title: "Model based grading"
source: "https://anthropic.skilljar.com/claude-with-the-anthropic-api/287742"
author:
published:
created: 2026-05-08
description: "Learn to build with Claude through Anthropic's comprehensive courses and training programs."
tags:
  - "clippings"
---
## Header Navigation

[Anthropic Academy](https://www.anthropic.com/learn) [Courses](https://anthropic.skilljar.com/) 

  [details](#)

[

**1**  
download

](#)

## Model based grading

 

This video is still being processed. Please check back later and refresh the page.

Summary

#### Summary

When building prompt evaluation workflows, grading systems provide objective signals about output quality. A grader takes model output and returns some kind of measurable feedback - typically a number between 1 and 10, where 10 represents high quality and 1 represents poor quality.

## Types of Graders

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623451%2F04_-_005_-_Model_Based_Grading_03.1748623451557.png)

There are three main approaches to grading model outputs:

- **Code graders** - Programmatically evaluate outputs using custom logic
- **Model graders** - Use another AI model to assess the quality
- **Human graders** - Have people manually review and score outputs

### Code Graders

Code graders let you implement any programmatic check you can imagine. Common uses include:

- Checking output length
- Verifying output does/doesn't have certain words
- Syntax validation for JSON, Python, or regex
- Readability scores

The only requirement is that your code returns some usable signal - usually a number between 1 and 10.

### Model Graders

Model graders feed your original output into another API call for evaluation. This approach offers tremendous flexibility for assessing:

- Response quality
- Quality of instruction following
- Completeness
- Helpfulness
- Safety

### Human Graders

Human graders provide the most flexibility but are time-consuming and tedious. They're useful for evaluating:

- General response quality
- Comprehensiveness
- Depth
- Conciseness
- Relevance

## Defining Evaluation Criteria

![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623452%2F04_-_005_-_Model_Based_Grading_06.1748623452682.png)

Before implementing any grader, you need clear evaluation criteria. For a code generation prompt, you might focus on:

- **Format** - Should return only Python, JSON, or Regex without explanation
- **Valid Syntax** - Produced code should have valid syntax
- **Task Following** - Response should directly address the user's task with accurate code
![](https://everpath-course-content.s3-accelerate.amazonaws.com/instructor%2Fa46l9irobhg0f5webscixp0bs%2Fpublic%2F1748623453%2F04_-_005_-_Model_Based_Grading_07.1748623453532.png)

The first two criteria work well with code graders, while task following is better suited for model graders due to their flexibility.

## Implementing a Model Grader

Here's how to build a model grader function:

```js
def grade_by_model(test_case, output):
    # Create evaluation prompt
    eval_prompt = """
    You are an expert code reviewer. Evaluate this AI-generated solution.
    
    Task: {task}
    Solution: {solution}
    
    Provide your evaluation as a structured JSON object with:
    - "strengths": An array of 1-3 key strengths
    - "weaknesses": An array of 1-3 key areas for improvement  
    - "reasoning": A concise explanation of your assessment
    - "score": A number between 1-10
    """
    
    messages = []
    add_user_message(messages, eval_prompt)
    add_assistant_message(messages, "\`\`\`json")
    
    eval_text = chat(messages, stop_sequences=["\`\`\`"])
    return json.loads(eval_text)
```
```js
def run_test_case(test_case):
    output = run_prompt(test_case)
    
    # Grade the output
    model_grade = grade_by_model(test_case, output)
    score = model_grade["score"]
    reasoning = model_grade["reasoning"]
    
    return {
        "output": output, 
        "test_case": test_case, 
        "score": score,
        "reasoning": reasoning
    }
```

``` `` `                                                                                                     #### Downloads                               - 001_prompt_evals_grader.ipynb 	                                                (opens in new tab)                                                                 ` `` ```

``` `` `                                                               Previous                     - Running the eval                                                    Model based grading                                                                                                                 Code based grading                                                      Next                                                                                                                                  Complete                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ` `` ```

``` `` `  ` `` ```