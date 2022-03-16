import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrarWorkflowComponent } from './registrar-workflow.component';

describe('RegistrarWorkflowComponent', () => {
  let component: RegistrarWorkflowComponent;
  let fixture: ComponentFixture<RegistrarWorkflowComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RegistrarWorkflowComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistrarWorkflowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
